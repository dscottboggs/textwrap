require "./spec_helper"

describe Textwrap::Scanner do
  describe "@words" do
    it "yields the expected words" do
      scanner = Textwrap::Scanner.new("a quick brown\n\tfox jumped over the lazy\n\ndog")
      scanner.words.join(' ').should eq "a quick brown fox jumped over the lazy dog"
    end
  end
  describe "#wrap" do
    it "wraps some text to 80 characters wide" do
      Textwrap::Scanner.wrap_text(LOREM_IPSUM).should eq WRAPPED_LOREM_IPSUM
    end
  end
end

describe String do
  describe "#wrap" do
    it "wraps some arbitrary text" do
      LOREM_IPSUM.wrap.should eq WRAPPED_LOREM_IPSUM
    end
  end
  describe "#wrap_paragraph" do
    it "wraps some text into a single paragraph regardless of line breaks" do
      "a quick brown\n\tfox jumped over the lazy\n\ndog".wrap_paragraph
        .should eq "a quick brown fox jumped over the lazy dog"
    end
  end
end

LOREM_IPSUM = <<-HERE
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras facilisis, elit nec rhoncus commodo, massa libero tristique tortor, sagittis auctor lectus neque nec arcu. Mauris ultrices interdum interdum. Mauris id tortor a lacus porttitor volutpat eleifend a eros. Nam facilisis sodales ante id tempus. Donec mauris turpis, porta ut enim non, dapibus facilisis ligula. Sed lobortis, leo eu malesuada finibus, felis velit viverra lectus, in fringilla felis ante vitae sapien. Praesent vitae lorem consequat, congue justo quis, tristique arcu. Morbi ac convallis eros, at iaculis sem. Quisque et ultrices diam, ut vulputate neque. In vulputate erat dolor, sit amet volutpat magna vestibulum ut. Nam ut consectetur leo. Donec id tincidunt elit. In non blandit sapien, vitae interdum purus. Ut pulvinar tempor posuere. Nam id ullamcorper ligula. Morbi finibus orci nibh, id laoreet augue sodales et.

Sed vulputate fermentum viverra. Duis accumsan lectus ut sapien congue consequat. Praesent lacinia hendrerit diam ac luctus. Cras vitae ornare ante. Sed rhoncus turpis vitae ipsum vulputate condimentum. Pellentesque ac odio in elit interdum pretium eu vel velit. Cras sit amet semper leo, vitae ullamcorper ex. Fusce nec nisi ex. Curabitur quis vehicula elit, sit amet ornare justo. Pellentesque vulputate quam tortor, sit amet ultricies felis dignissim eu. Sed quis placerat sem, ut commodo nulla. Vivamus feugiat, urna a pellentesque varius, est lorem luctus nulla, sit amet pretium est ante in nunc. Quisque ut lacinia dolor, consectetur faucibus mauris. Nulla nulla ipsum, euismod sit amet mauris nec, semper dictum ligula. In vulputate at neque id feugiat.

Nunc eleifend imperdiet lectus in tincidunt. Etiam pellentesque sodales justo aliquam gravida. Integer mollis bibendum felis. Mauris commodo dignissim nulla ac vehicula. Suspendisse ultrices ante non imperdiet volutpat. Mauris tempus dui ac tempor porta. Morbi purus nisi, pharetra et leo in, venenatis sollicitudin metus. Maecenas faucibus pretium libero, in commodo ligula ullamcorper feugiat. In dignissim est tempor urna auctor pretium. Donec interdum consectetur placerat.

In consectetur ullamcorper nisl eget vulputate. Donec a placerat dui. Fusce eget lobortis elit. Quisque eleifend ut augue id sollicitudin. Suspendisse aliquam, quam vehicula suscipit feugiat, urna justo scelerisque elit, eget laoreet eros mi ac urna. In id pulvinar lorem. Suspendisse et diam eu magna blandit sodales. Quisque eros mi, dictum et ligula at, placerat dignissim diam.

Nulla faucibus ultricies nisi, ut ultricies sem bibendum eu. In lacinia ultricies augue, quis semper turpis tempus quis. Donec et porta sem. Aenean sit amet laoreet nibh. Fusce suscipit suscipit ex eget tempor. Vivamus id turpis scelerisque, interdum eros ac, porta sem. Donec nulla est, sollicitudin elementum posuere sed, faucibus eget nulla.
HERE

WRAPPED_LOREM_IPSUM = <<-HERE
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras facilisis, elit
nec rhoncus commodo, massa libero tristique tortor, sagittis auctor lectus neque
nec arcu. Mauris ultrices interdum interdum. Mauris id tortor a lacus porttitor
volutpat eleifend a eros. Nam facilisis sodales ante id tempus. Donec mauris
turpis, porta ut enim non, dapibus facilisis ligula. Sed lobortis, leo eu
malesuada finibus, felis velit viverra lectus, in fringilla felis ante vitae
sapien. Praesent vitae lorem consequat, congue justo quis, tristique arcu. Morbi
ac convallis eros, at iaculis sem. Quisque et ultrices diam, ut vulputate neque.
In vulputate erat dolor, sit amet volutpat magna vestibulum ut. Nam ut
consectetur leo. Donec id tincidunt elit. In non blandit sapien, vitae interdum
purus. Ut pulvinar tempor posuere. Nam id ullamcorper ligula. Morbi finibus orci
nibh, id laoreet augue sodales et.

Sed vulputate fermentum viverra. Duis accumsan lectus ut sapien congue
consequat. Praesent lacinia hendrerit diam ac luctus. Cras vitae ornare ante. Sed
rhoncus turpis vitae ipsum vulputate condimentum. Pellentesque ac odio in elit
interdum pretium eu vel velit. Cras sit amet semper leo, vitae ullamcorper ex.
Fusce nec nisi ex. Curabitur quis vehicula elit, sit amet ornare justo.
Pellentesque vulputate quam tortor, sit amet ultricies felis dignissim eu. Sed
quis placerat sem, ut commodo nulla. Vivamus feugiat, urna a pellentesque varius,
est lorem luctus nulla, sit amet pretium est ante in nunc. Quisque ut lacinia
dolor, consectetur faucibus mauris. Nulla nulla ipsum, euismod sit amet mauris
nec, semper dictum ligula. In vulputate at neque id feugiat.

Nunc eleifend imperdiet lectus in tincidunt. Etiam pellentesque sodales justo
aliquam gravida. Integer mollis bibendum felis. Mauris commodo dignissim nulla ac
vehicula. Suspendisse ultrices ante non imperdiet volutpat. Mauris tempus dui ac
tempor porta. Morbi purus nisi, pharetra et leo in, venenatis sollicitudin metus.
Maecenas faucibus pretium libero, in commodo ligula ullamcorper feugiat. In
dignissim est tempor urna auctor pretium. Donec interdum consectetur placerat.

In consectetur ullamcorper nisl eget vulputate. Donec a placerat dui. Fusce eget
lobortis elit. Quisque eleifend ut augue id sollicitudin. Suspendisse aliquam,
quam vehicula suscipit feugiat, urna justo scelerisque elit, eget laoreet eros mi
ac urna. In id pulvinar lorem. Suspendisse et diam eu magna blandit sodales.
Quisque eros mi, dictum et ligula at, placerat dignissim diam.

Nulla faucibus ultricies nisi, ut ultricies sem bibendum eu. In lacinia
ultricies augue, quis semper turpis tempus quis. Donec et porta sem. Aenean sit
amet laoreet nibh. Fusce suscipit suscipit ex eget tempor. Vivamus id turpis
scelerisque, interdum eros ac, porta sem. Donec nulla est, sollicitudin elementum
posuere sed, faucibus eget nulla.
HERE
