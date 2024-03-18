#!/bin/bash

# This script sets up a working directory with necessary NLP models and tools.
# It takes one argument: the target directory path where the models and files will be downloaded and set up.

# The first argument to the script is the target directory path.
TARGET_DIR="$1"

# URL of the file to download.
# This is a grammar file needed for JSON processing.
FILE_URL="https://raw.githubusercontent.com/Querent-ai/querent-docs/main/querent/docs/get-started/json.gbnf"
# The desired name for the downloaded file to maintain consistency.
FILENAME="json.gbnf"

# URL of the spaCy model to download.
# spaCy models are used for various NLP tasks such as tokenization, parsing, and named entity recognition.
SPACY_MODEL_URL="https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.7.1/en_core_web_lg-3.7.1.tar.gz"
# The filename for the spaCy model.
SPACY_MODEL_FILENAME="en_core_web_lg-3.7.1.tar.gz"

# URL of the LLaMA model to download.
# LLaMA models are powerful language models used for generating human-like text.
LLAMA_MODEL_URL="https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q5_K_M.gguf?download=true"
# The filename for the LLaMA model to ensure correct naming.
LLAMA_MODEL_NAME="llama-2-7b-chat.Q5_K_M.gguf"

# Check if the target directory exists to avoid duplicate efforts.
if [ -d "$TARGET_DIR" ]; then
  echo "Directory exists: $TARGET_DIR"
else
  # If the directory does not exist, create it to house the downloads.
  mkdir -p "$TARGET_DIR"
  if [ $? -eq 0 ]; then
    echo "Directory created: $TARGET_DIR"
  else
    echo "Failed to create directory: $TARGET_DIR"
    exit 1
  fi
fi

# Change the current directory to the target directory.
cd "$TARGET_DIR" || exit

# Download the specific JSON grammar file using wget and rename it for consistency.
wget -O "$FILENAME" "$FILE_URL"

# Download the spaCy model file to the target directory.
wget -O "$SPACY_MODEL_FILENAME" "$SPACY_MODEL_URL"

# Decompress the spaCy model file for use.
tar -xvzf "$SPACY_MODEL_FILENAME"

# Remove the compressed spaCy model file to conserve space.
rm "$SPACY_MODEL_FILENAME"

# Download the LLaMA model file, naming it consistently.
wget -O "$LLAMA_MODEL_NAME" "$LLAMA_MODEL_URL"

# Install the NLTK library, specifying a version for consistency and compatibility.
pip install nltk==3.8.1

# Check if the nltk_data directory exists to avoid redownloading.
if [ -d "nltk_data" ]; then
  echo "Directory exists: nltk_data"
else
  # If the nltk_data directory does not exist, create it to store NLTK models.
  mkdir -p "nltk_data"
  if [ $? -eq 0 ]; then
    echo "Directory created: nltk_data"
  else
    echo "Failed to create directory: nltk_data"
    exit 1
  fi
fi

# Download all NLTK models to the specified directory, preparing for NLP tasks.
python3 -c "import nltk; nltk.download('all', download_dir='$TARGET_DIR/nltk_data')"

# Inform the user of completion of NLTK model downloads.
echo "NLTK models download completed."

# Set an environment variable for the model path, allowing other scripts to locate the models.
MODEL_PATH="$TARGET_DIR"
export MODEL_PATH
echo "MODEL PATH set."
