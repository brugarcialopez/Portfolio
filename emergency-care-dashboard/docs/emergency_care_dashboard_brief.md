# Emergency Department Dashboard Project Brief

## Business case

The health service department of the Principality of Asturias wants to understand emergency-department activity and quality of care. The analysis should help identify pressure in the patient-care pathway or signs of service saturation. For this assignment, care quality focuses on the time taken to respond to emergency patients.

## Business questions

- How did emergency visits change during the beginning of 2025?
- How were visits distributed by hospital and treating service?
- What proportion of emergency visits resulted in hospital admission?
- How long did patients wait for their first medical assessment?
- How long did patients wait for triage and prioritization?

## Data fields

The emergency-visit table includes: `id_urgencia` (unique visit identifier), `servicio` (service), `procedencia` (patient origin), `fecha_llegada` (arrival timestamp), `motivo` (reason for attendance), `triaje` (triage category), `fecha_triaje` (triage timestamp), `fecha_asignacion` (first-assessment timestamp), `facility` (hospital), `edificio` (building), `unidad` (unit), `zona` (area), `box` (treatment bay), `fecha_salida` (discharge timestamp), `propuesta_ingreso` (whether admission was proposed), and `fecha_orden_ingreso` (admission-order timestamp).

Triage is a patient-classification system used in emergency departments to prioritize the most serious cases and organize care resources.

## Dashboard requirements

1. Define and display at least three relevant KPIs.
2. Add two or three dashboard-level filters and at least one chart-level filter.
3. Create at least three visualizations combining dimensions that help explain visits, admissions, and the business questions.
4. Add a parameter that meaningfully changes the visualizations. The assignment leaves the parameter use case open.
