class TrackList

  def initialize
    @list = []
  end

  
  def add(*track)
    error_message if track.empty?
    @list << track
    form_array
  end
  
  def show_list
    @list
  end

  private

  def error_message
    raise 'You cannot add a track without a name'
  end

  def form_array
    @list.flatten!.uniq!
  end
end