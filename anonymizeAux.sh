#!/bin/bash

function usage()
{
echo "
$0: Script to anonymize the aux_file field in NIFTI images. Requires AFNI nifti_tool
  usage:
    $0 -i input.nii.gz -o output.nii.gz [options]
"
}

replacementString="ANONYMIZED"

function help()
{
  usage

  cat <<-USAGETEXT

  required options:
    -i path           Input NIFTI image.

    -o path           Output NIFTI image.

  optional:
    -h                Print help.

    -c string         String up to 24 characters to place in the aux_file field (default="$replacementString")

USAGETEXT
}

if [[ $# -lt 1 ]]; then
  usage
  echo "Try $0 -h for more information."
  exit 2
fi

while getopts "i:o:c:h" opt; do
  case $opt in
    c) replacementString=$OPTARG;;
    i) inputImage=$(readlink -m "$OPTARG");;
    o) outputImage=$(readlink -m "$OPTARG");;
    h) help; exit 0;;
    \?) echo "Unknown option $OPTARG"; exit 2;;
    :) echo "Option $OPTARG requires an argument"; exit 2;;

  esac
done

if [[ ! -f "$inputImage" ]]; then
    usage
    exit 1
fi

##############################################

jobTmpDir=$( mktemp -p /tmp -d anonymizeAux.XXXXXXX.tmpdir )

if [[ ! -d "$jobTmpDir" ]]; then
  echo "Could not create job temp dir ${jobTmpDir}"
  exit 1
fi

# check for AFNI executable
tool=$( which nifti_tool )

if [[ ! -f "$tool" ]]; then
    echo "Cannot find AFNI nifti_tool executable"
    exit 1
fi

tmpInputNii="$(mktemp -p ${jobTmpDir} inputNii_XXXXX.nii)"

if [[ "$inputImage" =~ \.nii$ ]]; then
    cp "$inputImage" "$tmpInputNii"
elif [[ "$inputImage" =~ \.nii\.gz$ ]]; then
    rm ${tmpInputNii}
    cp $inputImage "${tmpInputNii}.gz"
    gunzip "${tmpInputNii}.gz"
else
    echo "Input must be in NIFTI format (.nii or .nii.gz)"
    exit 1
fi

# make the edit
nifti_tool -mod_nim -mod_field aux_file "$replacementString" -infiles ${tmpInputNii} -overwrite

# Copy to output
if [[ "$outputImage" =~ \.nii$ ]]; then
    cp "$tmpInputNii" "$outputImage"
elif [[ "$outputImage" =~ \.nii\.gz$ ]]; then
    cp $tmpInputNii "${outputImage%.gz}"
    gzip "${outputImage%.gz}"
fi

if [[ -d "${jobTmpDir}" ]]; then
    rm ${jobTmpDir}/*
    rmdir $jobTmpDir
fi