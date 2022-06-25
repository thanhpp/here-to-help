cwlVersion: v1.0

class: CommandLineTool
id: echo

requirements:
    - class: DockerRequirement
      dockerPull: alpine:latest

inputs:
    echothis: 
      type: string
    echoid: 
      type: string

outputs:
    output:
        type: File
        outputBinding:
            glob: '*.txt'

baseCommand:
- echo

arguments:
- position: 0
  valueFrom: >-
    $(inputs.echothis) > $(inputs.echoid).txt
  shellQuote: false