EMBS_DIR=/data/yolov8

git clone https://github.com/deepghs/embeddings_tools.git ${EMBS_DIR}
cd ${EMBS_DIR}

conda create -n embeddings_tools python=3.10 cudnn cuda-cudart libcufft -y
source activate embeddings_tools
pip install -r requirements.txt
conda info
python --version
pip list
