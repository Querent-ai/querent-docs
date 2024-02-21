#!/bin/bash

# The first argument to the script is the path
TARGET_DIR="$1"

# URL of the file to download
FILE_URL="https://raw.githubusercontent.com/Querent-ai/querent-docs/Local-model-Update/querent/docs/get-started/json.gbnf"
# The desired name for the downloaded file
FILENAME="json.gbnf"

#URL of the spacy models
SPACY_MODEL_URL="https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.7.1/en_core_web_lg-3.7.1.tar.gz"
# The filename for the spaCy model
SPACY_MODEL_FILENAME="en_core_web_lg-3.7.1.tar.gz"

#URL of the llama model to download
LLAMA_MODEL_URL="https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q5_K_M.gguf?download=true"
#The filename for the llama model
LLAMA_MODEL_NAME="llama-2-7b-chat.Q5_K_M.gguf"

# Check if the directory exists
if [ -d "$TARGET_DIR" ]; then
  echo "Directory exists: $TARGET_DIR"
else
  # The directory does not exist, create the directory
  mkdir -p "$TARGET_DIR"
  if [ $? -eq 0 ]; then
    echo "Directory created: $TARGET_DIR"
  else
    echo "Failed to create directory: $TARGET_DIR"
    exit 1
  fi
fi

# Change to the target directory
cd "$TARGET_DIR" || exit


# Download the specific file and name it json.gbnf using wget
wget -O "$FILENAME" "$FILE_URL"

# Download the spaCy model file
wget -O "$SPACY_MODEL_FILENAME" "$SPACY_MODEL_URL"

# Decompress the spaCy model file
tar -xvzf "$SPACY_MODEL_FILENAME"

rm "$SPACY_MODEL_FILENAME"

wget -O "$LLAMA_MODEL_NAME" "$LLAMA_MODEL_URL"

#Install nltk
pip install nltk==3.8.1

if [ -d "nltk_data" ]; then
  echo "Directory exists: nltk_data"
else
  # The directory does not exist, create the directory
  mkdir -p "nltk_data"
  if [ $? -eq 0 ]; then
    echo "Directory created: nltk_data"
  else
    echo "Failed to create directory: nltk_data"
    exit 1
  fi
fi


# Download all NLTK models to the specified directory using Python
python3 -c "import nltk; nltk.download('all', download_dir='$TARGET_DIR/nltk_data')"

echo "NLTK models download completed."

MODEL_PATH="$TARGET_DIR"
export MODEL_PATH
echo "MODEL PATH set."
