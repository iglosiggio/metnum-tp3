# From: https://github.com/tdegeus/pybind11_examples#diy
CXXFLAGS += -Ieigen/           \
            -Ipybind11/include \
            -shared -fPIC      \
            $$(python3-config --cflags --ldflags --libs)

all: metnum.so

eigen:
	git clone --depth 1 --branch 3.3.7 https://github.com/eigenteam/eigen-git-mirror $@

pybind11:
	git clone --depth 1 --branch v2.8.0 https://github.com/pybind/pybind11 $@

metnum.so: metnum.cpp eigen pybind11
	$(CXX) $(CXXFLAGS) $< -o $@

grupo13-tp3.zip:
	git archive --prefix=grupo13-tp3/ --format zip HEAD > $@

clean:
	rm -f metnum.so grupo13-tp3.zip

.PHONY: all clean grupo13-tp3.zip
