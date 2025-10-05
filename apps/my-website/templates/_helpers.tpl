{{/*
Return the base name of the chart.
*/}}
{{- define "my-website.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Return the full name of the app.
If fullnameOverride is set, use that.
Otherwise combine the release name and chart name.
*/}}
{{- define "my-website.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "my-website.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels for metadata
*/}}
{{- define "my-website.labels" -}}
app: {{ include "my-website.name" . }}
release: {{ .Release.Name }}
{{- end }}


{{/*
Label selector
*/}}

{{- define "my-website.selectorLabels" -}}
app: {{ include "my-website.name" . }}
{{- end }}