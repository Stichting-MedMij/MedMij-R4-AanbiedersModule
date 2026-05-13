// All LogicalModels used in ProviderTasks

Logical: LmTask
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-Task
Title: "Task"
Description: "Patient-specific task that tells a patient what to do as part of a digital care activity. A Task is shown in the patient’s task list and supports tracking progress and completion over time."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "To represent a patient-facing task for a digital activity, so the patient can see what is expected, when it should be done, and whether it is open or completed. A Task can represent either a main task or a subtask within the same activity."
* insert Copyright
* ^abstract = true
* .
  * ^alias = "Taak"
* ActivityDefinition 0..1 Reference(LmActivity) "Reference to the digital activity definition associated with this task."
  * ^alias = "DigitaleActiviteit"
* BasedOn 0..1 Reference(LmServiceRequest) "Clinical order that triggered this patient task. May include patient-specific instructions and the requested schedule."
  * ^alias = "GebaseerdOp"
* Status 0..1 code "Current state of the Task in the workflow (e.g., requested, received, accepted, in-progress, completed, cancelled)."
  * ^alias = "Status"
* Priority 0..1 code "Indicates how urgent it is to perform the activity (e.g., routine, urgent, asap)."
  * ^alias = "Prioriteit"
* Description 0..1 string "Short instruction for the patient describing what to do. Keep the text concise and readable on mobile."
  * ^alias = "Omschrijving"
* ExecutionPeriod 0..1 Period "Time window in which the task should be performed (start/end), if applicable."
  * ^alias = "Periode"
* Requester 0..1 Reference(MedMijCoreLmHealthProfessional) "The person or role who requested or initiated this Task."
  * ^alias = "Aanvrager"

Mapping: LmTaskMedMij-100-alpha1
Source: LmTask
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-1" "Task"
* ActivityDefinition -> "pt-dataelement-2" "ActivityDefinition"
* BasedOn -> "pt-dataelement-3" "BasedOn"
* Status -> "pt-dataelement-4" "Status"
* Priority -> "pt-dataelement-5" "Priority"
* Description -> "pt-dataelement-6" "Description"
* ExecutionPeriod -> "pt-dataelement-7" "ExecutionPeriod"
* Requester -> "pt-dataelement-8" "Requester"

Logical: LmActivity
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-Activity
Title: "Digital Activity"
Description: "Reusable definition of a digital activity (module) that can be selected by a healthcare professional and presented to a patient as part of the care process. The activity describes what the patient will do (e.g., read information, complete a questionnaire, perform a home measurement) and provides the information needed to start or access the activity when applicable."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "To describe a reusable digital activity that can be selected and assigned by a healthcare professional to support the care process for a patient. The activity provides patient-facing content or actions (e.g., information, questionnaires, or home measurements)."
* insert Copyright
* ^abstract = true
* .
  * ^alias = "Digitale Activiteit"
* Title 0..1 string "Short, human-friendly title for the digital activity."
  * ^alias = "Titel"
* Status 0..1 code "Lifecycle status of the digital activity (e.g., draft, active, retired). A retired activity can no longer be selected or assigned."
  * ^alias = "Status"
* Publisher 0..1 string "Organization responsible for the content/functionality of this digital activity and its maintenance."
* Description 0..1 markdown "Guidance on how this digital activity should be used in clinical workflows."
  * ^alias = "Omschrijving"
* Timing 0..1 Timing "Generic recommendation for how often/when the activity is typically performed. Patient-specific scheduling belongs in the clinical order (e.g., ServiceRequest)."
  * ^alias = "Tijdschema"

Mapping: LmActivityMedMij-100-alpha1
Source: LmActivity
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-9" "Activity"
* Title -> "pt-dataelement-10" "Title"
* Status -> "pt-dataelement-11" "Status"
* Publisher -> "pt-dataelement-12" "Publisher"
* Description -> "pt-dataelement-13" "Description"
* Timing -> "pt-dataelement-14" "Timing"

Logical: LmServiceRequest
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: pt-lm-ServiceRequest
Title: "ServiceRequest"
Description: "Patient-specific clinical order for a digital activity, created by a healthcare professional for a patient."
Characteristics: #can-be-target
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "To represent a healthcare professional’s clinical order to start or perform a specific digital activity for a patient. The ServiceRequest captures the intended schedule and patient-specific instructions and can serve as the basis for one or more patient-facing Tasks that track execution and completion."
* insert Copyright
* ^abstract = true
* .
  * ^alias = "Zorgopdracht"
* PatientInstruction 1..1 string "Patient-oriented instructions that may differ from or add to the generic activity information (e.g., fasting measurements, preferred timing, preparation steps). These instructions should be shown alongside the Task(s) created from this order."
  * ^alias = "PatiëntenInstructie"
* Occurrence[x] 0..1 dateTime or Period or Timing "Requested schedule for performing the activity (e.g., duration, frequency, time of day)."
  * ^alias = "Tijdschema"
* Requester 0..1 Reference(MedMijCoreLmHealthProfessional) "Healthcare professional that requests this activity for the patient."
  * ^alias = "Aanvrager"

Mapping: LmServiceRequestMedMij-100-alpha1
Source: LmServiceRequest
Id: pt-dataset-100-alpha1-20260511
Title: "Dataset Aanbiedertaken MedMij 1.0.0-alpha.1 20260511"
* . -> "pt-dataelement-15" "ServiceRequest"
* PatientInstruction -> "pt-dataelement-16" "PatientInstruction"
* Occurrence[x] -> "pt-dataelement-17" "Occurrence"
* Requester -> "pt-dataelement-18" "Requester"

