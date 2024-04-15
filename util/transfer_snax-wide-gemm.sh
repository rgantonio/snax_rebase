export TARGET_ROOT=$HOME
export PROJECT=snitch_cluster
export CFG=snax-wide-gemm

ssh $USER@cygni-gw "mkdir -p $TARGET_ROOT/$CFG" && scp -r ../snitch_cluster/*  $USER@cygni-gw:$TARGET_ROOT/$CFG && scp -r ../snitch_cluster/.bender  $USER@cygni-gw:$TARGET_ROOT/$CFG && clear && clear && echo " " && echo "Files Benderized, Generated and Transfered -- Check the Synthesis Server" && echo " "  