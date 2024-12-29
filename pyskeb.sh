SKEB_DIR=/data/pyskeb

git clone https://narugo1992:${GH_TOKEN}@github.com/deepghs/pyskeb_backup.git ${SKEB_DIR}
cd ${SKEB_DIR}

conda create -n pyskeb python=3.10 cudnn cuda-cudart libcufft -y
source activate pyskeb
pip install -r requirements.txt
pip install -r requirements-extra.txt
pip install -U dghs-imgutils[gpu]
conda info
python --version
pip list

echo 'export LD_LIBRARY_PATH=/root/miniconda3/envs/pyskeb/lib:$LD_LIBRARY_PATH' > .envx
echo 'export LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64' > .envy
