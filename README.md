# atom-validator

An atom RSS validator that striclty checks XML syntax, XSD compliance and ensure there's at least 3 items

## Usage

### From source

```bash
git clone https://github.com/arthurchaloin/atom-validator.git
cd atom-validator
./validator <your_file.atom>
```

### From docker

```bash
docker run --rm -itv (pwd):/mnt arthurchaloin/rss-validator /mnt/your/file.atom
```
