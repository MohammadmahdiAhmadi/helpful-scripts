## translate.sh

The **translate.sh** script enables quick translation of selected text using Google Translate. It provides a convenient way to translate text and receive notifications of both the original text and its translation. The translation is initiated by a user-defined key combination (e.g., Alt+q).

### Usage

1. Ensure you have the required dependencies installed (`xsel`, `wget`, `notify-send`).
2. Open a terminal.
3. Clone this repository using `git clone https://github.com/MohammadmahdiAhmadi/helpful-scripts.git`.
4. Navigate to the directory containing the script: `cd helpful-scripts/02-translate/`.
5. Make the script executable: `chmod +x translate.sh`.
6. Run the script: `./translate.sh`.

When you select text and press the specified key combination (e.g., Alt+q), the script will translate the selected text using Google Translate and display a notification with both the original and translated text.

<br />

## translate-save.sh

The **translate-save.sh** script functions similarly to `translate.sh` but also offers the ability to save translated text pairs to a designated dictionary file. This can help you build a reference of translations over time.

### Usage

1. Ensure you have the required dependencies installed (`xsel`, `wget`, `notify-send`).
2. Open a terminal.
3. Clone this repository using `git clone https://github.com/MohammadmahdiAhmadi/helpful-scripts.git`.
4. Navigate to the directory containing the script: `cd helpful-scripts/02-translate/`.
5. Make the script executable: `chmod +x translate-save.sh`.
6. Run the script: `./translate-save.sh`.

When you select text and press the specified key combination (e.g., Alt+s), the script will translate the selected text using Google Translate, display a notification with both the original and translated text, and then append the text pair to a designated dictionary file located at `${HOME}/SavedDictionary.txt`.

<br />

### Target Language Parameter

The `targetLanguage` variable in the script determines the language to which the selected text will be translated. By default, it is set to `'fa'`, representing Persian. You can modify this variable to specify the target language of your choice. For example, to translate to French, you can set `targetLanguage='fr'`.

---

These scripts provide an efficient way to translate and optionally save translated text pairs. If you encounter any issues, have suggestions for improvement, or need assistance, feel free to reach out. Happy translating!
