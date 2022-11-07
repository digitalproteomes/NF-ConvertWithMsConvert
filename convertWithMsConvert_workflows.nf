//////////////////////////
// Workflow definitions //
//////////////////////////


include {convertWithMsConvert} from './convertWithMsConvert_processes.nf'


workflow convert{
    take:
    raw_folder
    conv_params
    monitor

    main:
    if(monitor) {
	rawFiles = channel.watchPath("${raw_folder}/*.raw")
    }
    else {
	rawFiles = channel.fromPath("${raw_folder}/*.raw")
    }

    convertWithMsConvert(rawFiles,
	  		 conv_params)
}
