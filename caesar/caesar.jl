# this file contains functions related to the caesar cipher

# function to add two characters together,
# only alfabethical characters will be added
function add_chars(char1::Char, char2::Char)
    """
    adds the two characters together if they are both alfabethical.
        The capitalisation of the first character is kept.
        If one of the characters is not alfabethical, the first character
        is returned.
    """
    # initialise the result
    result = char1;
    # add them together if they are alfabethical
    if isletter(char1) & isletter(char2)
        letter_num = ((Int(lowercase(char1))-Int('a')) + (Int(lowercase(char2))-Int('a'))) % 26;
        if islowercase(char1)
            result = 'a' + letter_num;
        else result = 'A' + letter_num;
        end
    end
    return result
end

# function to do the caesar substitution
function caesar_encrypt(text::String, key::Char)
    result = result = Array{Char,1}();
    for char in text
        if isletter(char);
            push!(result, add_chars(char, key));
        else
            push!(result, char);
        end
    end
    return join(result);
end

# function to decrypt the caesar substitution
function caesar_decrypt(text::String, key::Char)
    # find the "inverse key"
    num = Int(lowercase(key))-Int('a');
    inverse_key = 'a'+(26-num)%26;

    # decrypt
    return caesar_encrypt(text, inverse_key);
end
