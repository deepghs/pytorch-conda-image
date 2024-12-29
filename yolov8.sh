YOLOV8_DIR=/data/yolov8

git clone https://github.com/deepghs/yolov8.git ${YOLOV8_DIR}
cd ${YOLOV8_DIR}

conda create -n yolov8 python=3.10 cudnn cuda-cudart libcufft -y
source activate yolov8
pip install -r requirements.txt
pip install -r requirements-onnx.txt
pip install -U dghs-imgutils onnxruntime onnxslim
conda info
python --version
pip list

conda deactivate
conda create -n yolov8raw python=3.10 cudnn cuda-cudart libcufft -y
source activate yolov8raw
pip install -r requirements-raw.txt
pip install -r requirements-onnx.txt
pip install -U dghs-imgutils onnxruntime onnxslim
conda info
python --version
pip list
