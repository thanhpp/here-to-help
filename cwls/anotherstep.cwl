cwlVersion: v1.0

class: CommandLineTool
id: echo

requirements:
    - class: DockerRequirement
      dockerPull: alpine:latest

inputs:
    catfile: 
      type: File
    catid: 
      type: string

outputs:
    output:
        type: File
        outputBinding:
            glob: '*.txt'

baseCommand:
- cat

arguments:
- position: 0
  valueFrom: >-
    $(inputs.catfile) > $(inputs.catid).txt
  shellQuote: false