zairachem fit -i ../descriptors/polaris/train_bioavailability-ma.csv -m ../models/polaris/bioavailability-ma -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_bioavailability-ma.csv -m ../models/polaris/bioavailability-ma -o ../preds/polaris/bioavailability-ma

zairachem fit -i ../descriptors/polaris/train_hia-hou.csv -m ../models/polaris/hia-hou -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_hia-hou.csv -m ../models/polaris/hia-hou -o ../preds/polaris/hia-hou

zairachem fit -i ../descriptors/polaris/train_pgp-broccatelli.csv -m ../models/polaris/pgp-broccatelli -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_pgp-broccatelli.csv -m ../models/polaris/pgp-broccatelli -o ../preds/polaris/pgp-broccatelli

zairachem fit -i ../descriptors/polaris/train_bbb-martins.csv -m ../models/polaris/bbb-martins -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_bbb-martins.csv -m ../models/polaris/bbb-martins -o ../preds/polaris/bbb-martins

zairachem fit -i ../descriptors/polaris/train_cyp2c9-veith.csv -m ../models/polaris/cyp2c9-veith -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp2c9-veith.csv -m ../models/polaris/cyp2c9-veith -o ../preds/polaris/cyp2c9-veith

zairachem fit -i ../descriptors/polaris/train_cyp2d6-veith.csv -m ../models/polaris/cyp2d6-veith -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp2d6-veith.csv -m ../models/polaris/cyp2d6-veith -o ../preds/polaris/cyp2d6-veith

zairachem fit -i ../descriptors/polaris/train_cyp3a4-veith.csv -m ../models/polaris/cyp3a4-veith -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp3a4-veith.csv -m ../models/polaris/cyp3a4-veith  -o ../preds/polaris/cyp3a4-veith

zairachem fit -i ../descriptors/polaris/train_cyp2c9-substrate-carbonmangels.csv -m ../models/polaris/cyp2c9-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp2c9-substrate-carbonmangels.csv -m ../models/polaris/cyp2c9-substrate-carbonmangels -o ../preds/polaris/cyp2c9-substrate-carbonmangels

zairachem fit -i ../descriptors/polaris/train_cyp2d6-substrate-carbonmangels.csv -m ../models/polaris/cyp2d6-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp2d6-substrate-carbonmangels.csv -m ../models/polaris/cyp2d6-substrate-carbonmangels -o ../preds/polaris/cyp2d6-substrate-carbonmangels

zairachem fit -i ../descriptors/polaris/train_cyp3a4-substrate-carbonmangels.csv -m ../models/polaris/cyp3a4-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_cyp3a4-substrate-carbonmangels.csv -m ../models/polaris/cyp3a4-substrate-carbonmangels -o ../preds/polaris/cyp3a4-substrate-carbonmangels

zairachem fit -i ../descriptors/polaris/train_herg.csv -m ../models/polaris/herg -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_herg.csv -m ../models/polaris/herg -o ../preds/polaris/herg

zairachem fit -i ../descriptors/polaris/train_ames.csv -m ../models/polaris/ames -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_ames.csv -m ../models/polaris/ames -o ../preds/polaris/ames

zairachem fit -i ../descriptors/polaris/train_dili.csv -m ../models/polaris/dili -e descriptors.json
zairachem predict -i ../descriptors/polaris/smiles_test_dili.csv -m ../models/polaris/dili -o ../preds/polaris/dili