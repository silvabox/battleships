require 'battleships/cell'

describe Cell do
  it 'can be shot' do
    subject.receive_shot
    expect(subject).to be_shot
  end

  it 'hits the content when shot' do
    ship = double :ship
    subject.content = ship

    expect(ship).to receive :hit
    subject.receive_shot
  end

  it 'can be empty' do
    expect(subject).to be_empty
  end

  it 'can have content' do
    subject.content = :ship
    expect(subject.content).to be :ship
  end

  it 'is not empty if it has content' do
    subject.content = double :ship
    expect(subject).not_to be_empty
  end

  describe 'status' do
    it 'returns :none when empty and not shot' do
      expect(subject.status).to eq :none
    end
    it 'returns :none when not empty and not shot' do
      subject.content = double :ship, hit: nil
      expect(subject.status).to eq :none
    end
    it 'returns :miss when empty and shot' do
      subject.receive_shot
      expect(subject.status).to eq :miss
    end
    it 'returns :hit when not empty and shot' do
      subject.content = double :ship, hit: nil
      subject.receive_shot
      expect(subject.status).to eq :hit
    end
  end
end
