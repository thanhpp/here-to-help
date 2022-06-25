cwlVersion: v1.0

class: Workflow

id: test-cwl

inputs:
    echothis: string
    outputfile: string

outputs:
    file:
        type: File
        outputSource: step2/output

steps:
    step1:
        run: step.cwl
        in:
            echothis: echothis
            echoid: 
                source: outputfile
                valueFrom: $(self + "1")
        out:
            [output]

    step2:
        run: anotherstep.cwl
        in:
            catfile: step1/output
            catid: 
                source: outputfile
                valueFrom: $(self + "2")