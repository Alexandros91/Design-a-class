require 'track_list'

RSpec.describe TrackList do
  describe '#show_list' do
    context 'when the list is empty' do
      it 'shows an empty list' do
        my_list = TrackList.new
        expect(my_list.show_list).to eq []  
      end
    end
  end
  describe '#add' do
    context 'when we add without name' do
      it 'fails' do
        my_list = TrackList.new
        expect { my_list.add() }.to raise_error 'You cannot add a track without a name'
      end
    end
    
    context 'when we add a track with a name' do
      it 'adds the track to the list' do
        my_list = TrackList.new
        my_list.add("Moonchild")
        expect(my_list.show_list).to eq ["Moonchild"]
      end
    end

    context 'when we add an entry with multiple tracks' do
      it 'adds the tracks to the list' do
        my_list = TrackList.new
        my_list.add("Moonchild", "Toxic")
        expect(my_list.show_list).to eq ["Moonchild", "Toxic"]
      end
    end

    context 'when we add multiple entries' do
      it 'adds the tracks to the list' do
        my_list = TrackList.new
        my_list.add("Moonchild")
        my_list.add("Toxic")
        expect(my_list.show_list).to eq ["Moonchild", "Toxic"]
      end
    end

    context 'when we add duplicate tracks' do
      it 'does not add the same track again' do
        my_list = TrackList.new
        my_list.add("Moonchild")
        my_list.add("Moonchild")
        expect(my_list.show_list).to eq ["Moonchild"]
      end
    end
  end
end