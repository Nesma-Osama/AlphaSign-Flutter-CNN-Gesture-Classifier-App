# flask_app.py
import base64
from flask import Flask, request, jsonify
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.image import img_to_array, load_img
import numpy as np
import io
from PIL import Image

from flask_cors import CORS  # Import CORS
# Initialize app
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Load the pre-trained model
model = load_model('cnn_model.h5')

# Class labels for hand signs from A to Z (adjust based on your dataset)
class_labels = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
    'U', 'V', 'W', 'X', 'Y', 'Z'
]

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    if 'image' not in data:
        return jsonify({'error': 'No image data provided'}), 400

    # Decode the base64 image
    image_data = base64.b64decode(data['image'])
    image = Image.open(io.BytesIO(image_data)).convert("L")  # Convert to grayscale

    # Preprocess the image for your model
    image = image.resize((28, 28))
    image = img_to_array(image)
    image = image / 255.0
    image = np.expand_dims(image, axis=0)

    # Make a prediction
    prediction = model.predict(image)
    predicted_class = class_labels[np.argmax(prediction)]

    return jsonify({'class': predicted_class})

if __name__ == '__main__':
    app.run(debug=True)