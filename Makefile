poetry:
	pip install poetry
	poetry shell
	poetry install --no-root

train_kanerf:
	ns-train kanerf --data content/lego \
    --pipeline.model.background-color white \
    --pipeline.model.proposal-initial-sampler uniform \
    --pipeline.model.near-plane 2. --pipeline.model.far-plane 6. \
    --pipeline.model.hidden_dim 8 \
    --pipeline.model.hidden_dim_color 8 \
    --pipeline.model.num_layers 1 \
    --pipeline.model.num_layers_color 1 \
    --pipeline.model.geo_feat_dim 7 \
    --pipeline.model.appearance_embed_dim 8 \
    --pipeline.datamanager.camera-optimizer.mode off \
    --pipeline.model.use-average-appearance-embedding False \
    --pipeline.datamanager.train-num-rays-per-batch 4096 \
    --pipeline.datamanager.eval-num-rays-per-batch 4096 \
    --pipeline.model.distortion-loss-mult 0 --pipeline.model.disable-scene-contraction True \
    --vis viewer+tensorboard \
    blender-data

train_nerf:
	ns-train nerfacto --data content/lego \
    --pipeline.model.background-color white \
    --pipeline.model.proposal-initial-sampler uniform \
    --pipeline.model.near-plane 2. --pipeline.model.far-plane 6. \
    --pipeline.model.hidden_dim 64 \
    --pipeline.model.hidden_dim_color 64 \
    --pipeline.model.num_layers_color 2 \
    --pipeline.model.geo_feat_dim 15 \
    --pipeline.model.appearance_embed_dim 32 \
    --pipeline.datamanager.camera-optimizer.mode off \
    --pipeline.model.use-average-appearance-embedding False \
    --pipeline.datamanager.train-num-rays-per-batch 4096 \
    --pipeline.datamanager.eval-num-rays-per-batch 4096 \
    --pipeline.model.distortion-loss-mult 0 --pipeline.model.disable-scene-contraction True \
    --vis viewer+tensorboard \
    blender-data

train: 
	ns-train nerfacto --viewer.websocket-port 7007 --viewer.make-share-url True nerfstudio-data --data content/lego --downscale-factor 4