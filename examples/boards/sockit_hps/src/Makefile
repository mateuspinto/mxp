
BSP_DIR=bsp
bsp: ${BSP_DIR}/Makefile
	${MAKE} -C ${BSP_DIR}




${BSP_DIR}/Makefile: settings.bsp vblox1.sopcinfo
	rm -rf ${BSP_DIR}
	mkdir -p ${BSP_DIR}
	cp ./settings.bsp ${BSP_DIR}/settings.bsp
	bsp-generate-files --settings=${BSP_DIR}/settings.bsp --bsp-dir=${BSP_DIR}
	sopc-create-header-files --sopc vblox1.sopcinfo --single ${BSP_DIR}/system.h --module hps_0_arm_a9_0
	cp ./public.mk ${BSP_DIR}/
	cp ./io.c ${BSP_DIR}/
	cp ./*.ld ${BSP_DIR}/link.ld

clean:
	rm -rf ${BSP_DIR} *rpt *.htm *.htm_files *.summary vblox1 *.smsg *.sof *vblox1.sopcinfo *.log
	rm -rf hps_isw_handoff incremental_db db/ simulation/
