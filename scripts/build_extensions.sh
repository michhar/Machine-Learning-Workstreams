##########################################################
# build_extensions.sh
# Builds C and CUDA extesnions for this PyTorch example.
# Notes:
# - Use Python 3 (ensure this is default or use "alias python=/path/to/python3"
#
##########################################################

# Package needed by torch.utils.ffi, the object that builds the PyTorch extension
pip3 install cffi

cd ..

# Build the NMS PyTorch extension
cd src/extensions/nms/src/cuda/ && /usr/local/cuda/bin/nvcc -c -o nms_kernel.cu.o nms_kernel.cu -x cu -Xcompiler -fPIC -arch=sm_37 && \
cd ../../ && \
python3 build.py

cd ../../..

# Note - ensure that src/crop_and_resize.c is updated to this code fix (will now compile on GPU w/ torch==0.4.1)
# https://github.com/pfjaeger/medicaldetectiontoolkit/blob/master/cuda_functions/roi_align_2D/roi_align/src/crop_and_resize.c

cd src/extensions/roialign/roi_align/src/cuda/ && \
/usr/local/cuda/bin/nvcc -c -o crop_and_resize_kernel.cu.o crop_and_resize_kernel.cu -x cu -Xcompiler -fPIC -arch=sm_37 && \
cd ../../ && \
python3 build.py

cd ../../..

#python -m pip install docopt clint crontab tablib
#python -m pip install coco

#python -m pip install Cython

#rm -fr pycocotools

#cd src && git clone https://github.com/cocodataset/cocoapi.git && \
#    cd cocoapi/PythonAPI && \
#    python setup.py build_ext --inplace

#cp -r cocoapi/PythonAPI/pycocotools/ .


