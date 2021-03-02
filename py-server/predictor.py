import numpy as np
import mlflow

max_len=10

vocabulary = {'\t',
 '\n',
 'a',
 'b',
 'c',
 'd',
 'e',
 'f',
 'g',
 'h',
 'i',
 'j',
 'k',
 'l',
 'm',
 'n',
 'o',
 'p',
 'q',
 'r',
 's',
 't',
 'u',
 'v',
 'w',
 'x',
 'y',
 'z'}

# Sort the vocabulary
vocabulary_sorted = sorted(vocabulary)

# Create the mapping of the vocabulary chars to integers
char_to_idx = { char : idx for idx, char in enumerate(vocabulary_sorted) }

# Create the mapping of the integers to vocabulary chars
idx_to_char = { idx : char for idx, char in enumerate(vocabulary_sorted) }

model = mlflow.keras.load_model('model')

def generate_name():
    stop=False
    counter=1
    name = ''

    # Initialize first char of output sequence
    output_seq = np.zeros((1, max_len+1, len(vocabulary)))
    output_seq[0, 0, char_to_idx['\t']] = 1.

    # Continue until a newline is generated or max no of chars reached
    while stop == False and counter < 10:
        # Get probability distribution for next character
        probs = model.predict_proba(output_seq, verbose=0)[:,counter-1,:]
        # Sample vocabulary to get most probable next character
        c = np.random.choice(sorted(list(vocabulary)), replace=False, p=probs.reshape(28))
        if c=='\n':
            stop=True
        else:
            name = name + c
            output_seq[0, counter, char_to_idx[c]] = 1.
            counter=counter+1
    return name

def main():
    print(generate_name())

if __name__ == "__main__":
    main()