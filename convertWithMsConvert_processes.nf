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


process patchWineprefixP {
    // This process creates a copy of wineprefix from the container to /tmp
    // The copied files will be owned by the user running the analysis, hence
    // removing  wine mismatched ownership issues.
    publishDir 'Results/MzML', mode: 'link'
    
    input:

    output:
    file 'wineprefix.txt'

    script:
    """
    ORIGINAL_PREFIX=\${WINEPREFIX}
    WINEPREFIX=\$(mktemp -d /tmp/wineprefixXXXX)
    export WINEPREFIX
    cp -r /wineprefix64/* \$WINEPREFIX
    echo \$WINEPREFIX > wineprefix.txt
    """
}


process cleanPatchWineprefixP {
    input:
    val wineCopyFolder

    output:

    script:
    """
    rm -rf '$wineCopyFolder'
    """
}
