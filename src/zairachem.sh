zairachem fit -i ../descriptors/train_bioavailability-ma.csv -m ../models/bioavailability-ma -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_bioavailability-ma.csv -m ../models/bioavailability-ma -o ../results/zairachem/bioavailability-ma

zairachem fit -i ../descriptors/train_hia-hou.csv -m ../models/hia-hou -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_hia-hou.csv -m ../models/hia-hou -o ../results/zairachem/hia-hou

zairachem fit -i ../descriptors/train_pgp-broccatelli.csv -m ../models/pgp-broccatelli -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_pgp-broccatelli.csv -m ../models/pgp-broccatelli -o ../results/zairachem/pgp-broccatelli

zairachem fit -i ../descriptors/train_bbb-martins.csv -m ../models/bbb-martins -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_bbb-martins.csv -m ../models/bbb-martins -o ../results/zairachem/bbb-martins

zairachem fit -i ../descriptors/train_cyp2c9-veith.csv -m ../models/cyp2c9-veith -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp2c9-veith.csv -m ../models/cyp2c9-veith -o ../results/zairachem/cyp2c9-veith

zairachem fit -i ../descriptors/train_cyp2d6-veith.csv -m ../models/cyp2d6-veith -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp2d6-veith.csv -m ../models/cyp2d6-veith -o ../results/zairachem/cyp2d6-veith

zairachem fit -i ../descriptors/train_cyp3a4-veith.csv -m ../models/cyp3a4-veith -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp3a4-veith.csv -m ../models/cyp3a4-veith  -o ../results/zairachem/cyp3a4-veith

zairachem fit -i ../descriptors/train_cyp2c9-substrate-carbonmangels.csv -m ../models/cyp2c9-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp2c9-substrate-carbonmangels.csv -m ../models/cyp2c9-substrate-carbonmangels -o ../results/zairachem/cyp2c9-substrate-carbonmangels

zairachem fit -i ../descriptors/train_cyp2d6-substrate-carbonmangels.csv -m ../models/cyp2d6-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp2d6-substrate-carbonmangels.csv -m ../models/cyp2d6-substrate-carbonmangels -o ../results/zairachem/cyp2d6-substrate-carbonmangels

zairachem fit -i ../descriptors/train_cyp3a4-substrate-carbonmangels.csv -m ../models/cyp3a4-substrate-carbonmangels -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_cyp3a4-substrate-carbonmangels.csv -m ../models/cyp3a4-substrate-carbonmangels -o ../results/zairachem/cyp3a4-substrate-carbonmangels

zairachem fit -i ../descriptors/train_herg.csv -m ../models/herg -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_herg.csv -m ../models/herg -o ../results/zairachem/herg

zairachem fit -i ../descriptors/train_ames.csv -m ../models/ames -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_ames.csv -m ../models/ames -o ../results/zairachem/ames

zairachem fit -i ../descriptors/train_dili.csv -m ../models/dili -e descriptors.json
zairachem predict -i ../descriptors/smiles_test_dili.csv -m ../models/dili -o ../results/zairachem/dili