import React, { useState } from 'react';

const PictureUploader = () => {
  const [selectedImage, setSelectedImage] = useState(null);

  const handleImageChange = (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setSelectedImage(reader.result);
      };
      reader.readAsDataURL(file);
    }
  };

  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <h1>Загрузить изображение</h1>
      <input
        type="file"
        accept="image/*"
        onChange={handleImageChange}
        style={{ margin: '10px 0' }}
      />
      {selectedImage && (
        <div style={{ marginTop: '20px' }}>
          <img
            src={selectedImage}
            alt="Выбранное"
            style={{ maxWidth: '300px', maxHeight: '300px', borderRadius: '5px' }}
          />
        </div>
      )}
    </div>
  );
};

export default PictureUploader;