// This is a modification of the DIAN common deidentification script
- (0008,0050)                                                                        // Accession Number
- (0010,0021)                                                                        // Issuer of Patient ID
- (0010,0030)                                                                        // Patient's Birth Date
- (0010,0032)                                                                        // Patient's Birth Time
- (0010,0050)                                                                        // Patient's Insurance Plan Code SQ
- (0010,0101)                                                                        // Patient's Primary Language Code SQ
- (0010,1000)                                                                        // Other Patient IDs
- (0010,1001)                                                                        // Other Patient Names
- (0010,1002)                                                                        // Other Patient IDs SQ
- (0010,1005)                                                                        // Patient's Birth Name
- (0010,1040)                                                                        // Patient's Address
- (0010,1060)                                                                        // Patient's Mother's Birth Name
- (0010,1080)                                                                        // Military Rank
- (0010,1081)                                                                        // Branch of Service
- (0010,1090)                                                                        // Medical Record Locator
- (0010,2000)                                                                        // Medical Alerts
- (0010,2110)                                                                        // Allergies
- (0010,2150)                                                                        // Country of Residence
- (0010,2152)                                                                        // Region of Residence
- (0010,2154)                                                                        // Patient's Telephone Numbers
- (0010,2160)                                                                        // Ethnic Group
- (0010,2180)                                                                        // Occupation
- (0010,21A0)                                                                        // Smoking Status
- (0010,21B0)                                                                        // Additional Patient History
- (0010,21C0)                                                                        // Pregnancy Status
- (0010,21D0)                                                                        // Last Menstrual Date
- (0010,21F0)                                                                        // Patient's Religious Preference
- (0010,2203)                                                                        // Patient's Sex Neutered
- (0010,2297)                                                                        // Responsible Person
- (0010,2298)                                                                        // Responsible Person Role
- (0010,2299)                                                                        // Responsible Organization
(0012,0063) := "CCF common deidentification v001"
- (0038,0500)                                                                        // Patient State
- (0038,0100)                                                                        // Pertinent Documents SQ
- (0040,1400)                    	                                             // Requested Procedure Comments
- (0010,0033)                                                                        // Patient Birth Date in Alternative Calendar
- (0010,0034)                                                                        // Patient Death Date in Alternative Calendar
- (0010,1100)                                                                        // Referenced Patient Photo Sequence
- (0010,2155)                                                                        // Patient Telecom Information
 
// Set XNAT identifying fields
(0008,1030) := project
(0010,0010) := subject
(0010,0020) := session
