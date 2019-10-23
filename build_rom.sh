export CCACHE_EXEC=$(which ccache) && . build/envsetup.sh && lunch lineage_jflte-userdebug && make -j10 otapackage
