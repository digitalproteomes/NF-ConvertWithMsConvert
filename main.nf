nextflow.enable.dsl=2

include {convert} from './convertWithMsConvert_workflows.nf'

workflow {
    main:
    log.info("++++++++++========================================")
    log.info("Executing ConvertToMzML workflow")
    log.info("")
    log.info("Parameters:")
    log.info(" RAW folder:\t $params.raw_folder")
    log.info(" Conversion parameters:\t $params.conv_params")
    log.info("++++++++++========================================")

    convert(params.raw_folder,
	    params.conv_params,
	    params.monitor)
}
