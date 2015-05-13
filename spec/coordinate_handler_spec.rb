require 'battleships/coordinate_handler'

module Battleships
  describe CoordinateHandler do

    let(:invalid_coords) {   [:A11, :A0, :K1, :K10] }
    let(:valid_coords) {   [:A1, :B9, :I8, :J10] }

    describe 'each' do
      it 'enumerates all coordinates' do
        coords = []
        subject.each { |coord| coords << coord }

        valid_coords.each do |coord|
          expect(coords).to include coord
        end
      end
    end

    describe 'each_row' do
      it 'enumerates rows' do
        rows = []
        subject.each_row { |row, number| rows << row }

        [:A1, :A2, :A3, :A4, :A5, :A6, :A7, :A8, :A9, :A10].each do |start|
          expect(rows).to include subject.from start, 10
        end
      end
      it 'enumerates includes row numbers' do
        numbers = []
        subject.each_row { |row, number| numbers << number }

        (1..10).each do |number|
          expect(numbers).to include number
        end
      end
    end

    describe 'validate' do
      it 'raises error for invalid coords' do
        invalid_coords.each do |coord|
          expect{ subject.validate coord }.to raise_error 'Invalid coordinate'
        end
      end

      it 'does nothing for valid coords' do
        valid_coords.each do |coord|
          expect{ subject.validate coord }.not_to raise_error
        end
      end
    end

    describe 'valid?' do
      it 'returns false for invalid coords' do
        invalid_coords.each do |coord|
          expect(subject.valid? coord).to be_falsy
        end
      end

      it 'returns true for valid coords' do
        valid_coords.each do |coord|
          expect(subject.valid? coord).to be_truthy
        end
      end
    end

    context 'horizontal orientation' do
      describe 'from' do
        it 'returns all coords from the given start' do
          expect(subject.from :B4, 4).to eq [:B4, :C4, :D4, :E4]
        end
      end

      # describe 'horizontal_coords_for' do
      #   it 'returns an array of coordinates' do
      #     expect(subject.horizontal_coords_for 'C', 1, 3).to eq [:C1, :D1, :E1]
      #   end
      # end
      #
      # describe 'x_coords' do
      #   it 'returns the relevant slice of the horizontal coords' do
      #     expect(subject.x_coords 'E', 3).to eq ['E', 'F', 'G']
      #   end
      # end
    end

    context 'vertical orientation' do
      describe 'all_coords_for' do
        it 'returns all coords from the given start' do
          expect(subject.from :B4, 4, :vertically).to eq [:B4, :B5, :B6, :B7]
        end
      end

      # describe 'vertical_coords_for' do
      #   it 'returns an array of coordinates' do
      #     expect(subject.vertical_coords_for 'C', 1, 3).to eq [:C1, :C2, :C3]
      #   end
      # end
      #
      # describe 'y_coords' do
      #   it 'returns the relevant slice of the vertical coords' do
      #     expect(subject.y_coords '5', 3).to eq [5, 6, 7]
      #   end
      # end
    end
  end
end