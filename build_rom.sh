export CCACHE_EXEC=$(which ccache) && export USE_CCACHE=1 && . build/envsetup.sh && lunch lineage_jflte-userdebug && make -j10 otapackage
