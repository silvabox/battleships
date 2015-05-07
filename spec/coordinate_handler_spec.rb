require 'coordinate_handler'

describe CoordinateHandler do
  let(:invalid_coords) {   [:A11, :A0, :K1, :K10] }
  let(:valid_coords) {   [:A1, :B9, :I8, :J10] }

  describe 'validate_coords' do
    it 'raises error for invalid coords' do
      invalid_coords.each do |coords|
        expect{ subject.validate_coords coords }.to raise_error 'Invalid coordinates'
      end
    end

    it 'does nothing of valid coords' do
      valid_coords.each do |coords|
        expect{ subject.validate_coords coords }.not_to raise_error
      end
    end
  end

  describe 'valid_coords?' do
    it 'returns false for invalid coords' do
      invalid_coords.each do |coords|
        expect(subject.valid_coords? coords).to be_falsy
      end
    end

    it 'returns true for valid coords' do
      valid_coords.each do |coords|
        expect(subject.valid_coords? coords).to be_truthy
      end
    end
  end

  describe 'all_coords_for' do
    it 'returns all coords from the given start' do
      expect(subject.all_coords_for :B4, 4).to eq [:B4, :C4, :D4, :E4]
    end
  end

  describe 'horizontal_coords_for' do
    it 'returns an array of coordinates' do
      expect(subject.horizontal_coords_for 'C', 1, 3).to eq [:C1, :D1, :E1]
    end
  end

  describe 'x_coords' do
    it 'returns the relevant slice of the horizontal coords' do
      expect(subject.x_coords 'E', 3).to eq ['E', 'F', 'G']
    end
  end
end
