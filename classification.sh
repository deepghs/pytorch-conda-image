CLS_DIR=/data/classification

git clone https://github.com/deepghs/classification.git ${CLS_DIR}
cd ${CLS_DIR}

conda create -n classification python=3.10 cudnn cuda-cudart libcufft -y
source activate classification
pip install -r requirements.txt
pip install -r requirements-onnx.txt
pip install -U dghs-imgutils onnxruntime onnxslim
conda info
python --version
pip list
