from flask import Flask, request, jsonify
import pandas as pd
import jellyfish

app = Flask(__name__)

# Load the dataset
data = pd.DataFrame({"name": ["BUTTER, WITH SALT", "BANANA, YELLOW FRUIT", "ORANGE, ORANGE FRUIT", "KIWI, GREEN FRUIT", "PINEAPPLE, SPIKY FRUIT"]})

# Function to calculate phonetic similarity using Soundex
def soundex_similarity(s1, s2):
    return jellyfish.soundex(s1) == jellyfish.soundex(s2)

# Function to calculate phonetic similarity using Metaphone
def metaphone_similarity(s1, s2):
    return jellyfish.metaphone(s1) == jellyfish.metaphone(s2)

# Function to check if any word in the sentence matches the reference phonetically
def phonetic_word_match(sentence, reference):
    words = sentence.split(", ")
    for word in words:
        if soundex_similarity(word, reference) or metaphone_similarity(word, reference):
            return True
    return False

@app.route('/phonetic_similarity', methods=['POST'])
def phonetic_similarity():
    request_data = request.json
    print(request_data)
    reference = request_data['reference']
    
    # Calculate phonetic similarity for each entry in the dataset
    filtered_data = data[data["name"].apply(lambda x: phonetic_word_match(x, reference))]
    results = filtered_data["name"].tolist()
    
    return jsonify({'results': results})

if __name__ == '__main__':
    app.run(debug=True)
