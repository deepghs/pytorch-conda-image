CYBERHAREM_DIR=/data/cyberharem

git clone https://github.com/deepghs/cyberharem.git ${CYBERHAREM_DIR}
cd ${CYBERHAREM_DIR}

conda create -n cyberharem python=3.10 cudnn cuda-cudart libcufft -y
source activate cyberharem
pip install -r requirements.txt
pip install -U dghs-imgutils[gpu]
conda info
python --version
pip list

echo 'export LD_LIBRARY_PATH=/root/miniconda3/envs/cyberharem/lib:$LD_LIBRARY_PATH' > .envx
echo 'export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64' > .envy
