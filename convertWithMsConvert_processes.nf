process convertWithMsConvert {
    tag "$raw"
    publishDir 'Results/MzML', mode: 'link'

    afterScript "source ${projectDir}/bin/after_conversion.sh"

    input:
    file raw
    val conv_params


    output:
    file '*.mzML'

    script:
    //     "wine /wineprefix64/drive_c/pwiz/msconvert.axe ${conv_params} $raw"
    """
    wine msconvert ${conv_params} $raw
    """
}
