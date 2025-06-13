# LotteryNumbers

A command-line tool to generate random lottery numbers for:

- **Euromillones** (5 numbers + 2 stars)
- **Primitiva** (6 numbers + 2 stars)

Supports optional column based drawaing to simulate real lottery ticket layouts.

## Installation

### 1. Clone and build the project

```bash
git clone https://github.com/yhondri/LotteryNumbers
cd LotteryNumbers
swift build -c release
```

### 2. Install the executable globally

Option A: Symlink (recommended)

```
sudo ln -s "$(pwd)/.build/release/lotterynumbers" /usr/local/bin/lotterynumbers
```

Option B: Copy

```
sudo cp .build/release/lotterynumbers /usr/local/bin/
```

## Usage

lotterynumbers <command> [options]

### Example:

```
lotterynumbers euromillones
```

With one number per column:

```
lotterynumbers euromillones --perColumn true
```

All (Euromillones + Primitiva)

```
lotterynumbers all
```

```
lotterynumbers all -p true  # with columns
```
