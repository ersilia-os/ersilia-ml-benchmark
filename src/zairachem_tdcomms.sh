echo "=== Training: bioavailability-ma ==="
zairachem fit -i ../descriptors/tdcomms/train_bioavailability-ma.csv -m ../models/tdcomms/bioavailability-ma -e descriptors.json
echo "=== Predicting: bioavailability-ma ==="
zairachem predict -i ../descriptors/tdcomms/test_bioavailability-ma.csv -m ../models/tdcomms/bioavailability-ma -o ../preds/tdcomms/bioavailability-ma

echo "=== Training: hia-hou ==="
zairachem fit -i ../descriptors/tdcomms/train_hia-hou.csv -m ../models/tdcomms/hia-hou -e descriptors.json
echo "=== Predicting: hia-hou ==="
zairachem predict -i ../descriptors/tdcomms/test_hia-hou.csv -m ../models/tdcomms/hia-hou -o ../preds/tdcomms/hia-hou

echo "=== Training: pgp-brocatelli ==="
zairachem fit -i ../descriptors/tdcomms/train_pgp-broccatelli.csv -m ../models/tdcomms/pgp-broccatelli -e descriptors.json
echo "=== Predicting: pgp-brocatelli ==="
zairachem predict -i ../descriptors/tdcomms/test_pgp-broccatelli.csv -m ../models/tdcomms/pgp-broccatelli -o ../preds/tdcomms/pgp-broccatelli

echo "=== Training: bbb-martins ==="
zairachem fit -i ../descriptors/tdcomms/train_bbb-martins.csv -m ../models/tdcomms/bbb-martins -e descriptors.json
echo "=== Predicting: bbb-martins ==="
zairachem predict -i ../descriptors/tdcomms/test_bbb-martins.csv -m ../models/tdcomms/bbb-martins -o ../preds/tdcomms/bbb-martins

echo "=== Training: cyp2c9-veith ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp2c9-veith.csv -m ../models/tdcomms/cyp2c9-veith -e descriptors.json
echo "=== Predicting: cyp2c9-veith ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp2c9-veith.csv -m ../models/tdcomms/cyp2c9-veith -o ../preds/tdcomms/cyp2c9-veith

echo "=== Training: cyp2d6-veith ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp2d6-veith.csv -m ../models/tdcomms/cyp2d6-veith -e descriptors.json
echo "=== Predicting: cyp2d6-veith ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp2d6-veith.csv -m ../models/tdcomms/cyp2d6-veith -o ../preds/tdcomms/cyp2d6-veith

echo "=== Training: cyp3a4-veith ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp3a4-veith.csv -m ../models/tdcomms/cyp3a4-veith -e descriptors.json
echo "=== Predicting: cyp3a4-veith ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp3a4-veith.csv -m ../models/tdcomms/cyp3a4-veith  -o ../preds/tdcomms/cyp3a4-veith

echo "=== Training: cyp2c9-substrate-carbonmangels ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp2c9-substrate-carbonmangels.csv -m ../models/tdcomms/cyp2c9-substrate-carbonmangels -e descriptors.json
echo "=== Predicting: cyp2c9-substrate-carbonmangels ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp2c9-substrate-carbonmangels.csv -m ../models/tdcomms/cyp2c9-substrate-carbonmangels -o ../preds/tdcomms/cyp2c9-substrate-carbonmangels

echo "=== Training: cyp2d6-substrate-carbonmangels ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp2d6-substrate-carbonmangels.csv -m ../models/tdcomms/cyp2d6-substrate-carbonmangels -e descriptors.json
echo "=== Predicting: cyp2d6-substrate-carbonmangels ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp2d6-substrate-carbonmangels.csv -m ../models/tdcomms/cyp2d6-substrate-carbonmangels -o ../preds/tdcomms/cyp2d6-substrate-carbonmangels

echo "=== Training: cyp3a4-substrate-carbonmangels ==="
zairachem fit -i ../descriptors/tdcomms/train_cyp3a4-substrate-carbonmangels.csv -m ../models/tdcomms/cyp3a4-substrate-carbonmangels -e descriptors.json
echo "=== Predicting: cyp3a4-substrate-carbonmangels ==="
zairachem predict -i ../descriptors/tdcomms/test_cyp3a4-substrate-carbonmangels.csv -m ../models/tdcomms/cyp3a4-substrate-carbonmangels -o ../preds/tdcomms/cyp3a4-substrate-carbonmangels

echo "=== Training: herg ==="
zairachem fit -i ../descriptors/tdcomms/train_herg.csv -m ../models/tdcomms/herg -e descriptors.json
echo "=== Predicting: herg ==="
zairachem predict -i ../descriptors/tdcomms/test_herg.csv -m ../models/tdcomms/herg -o ../preds/tdcomms/herg

echo "=== Training: ames ==="
zairachem fit -i ../descriptors/tdcomms/train_ames.csv -m ../models/tdcomms/ames -e descriptors.json
echo "=== Predicting: ames ==="
zairachem predict -i ../descriptors/tdcomms/test_ames.csv -m ../models/tdcomms/ames -o ../preds/tdcomms/ames

echo "=== Training: dili ==="
zairachem fit -i ../descriptors/tdcomms/train_dili.csv -m ../models/tdcomms/dili -e descriptors.json
echo "=== Predicting: dili ==="
zairachem predict -i ../descriptors/tdcomms/test_dili.csv -m ../models/tdcomms/dili -o ../preds/tdcomms/dili


