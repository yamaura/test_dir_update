.PHONY: all clean test
OBJS:=original target new
LIST:=ls -la

all: original target new

original: ./build.sh
	./build.sh $@

target: ./build.sh
	./build.sh $@

new:
	mkdir -p new

rsync: CMD:=rsync -a
rsync: $(OBJS)
	$(CMD) original/ target/
	$(CMD) original/ new/

tar:
tar: $(OBJS)
	tar c -C original/ . | tar x -C target/
	tar c -C original/ . | tar x -C new/

.ONESHELL:
test:
	@bash -c 'paste <($(LIST) original) <($(LIST) target) <($(LIST) new)'

clean:
	rm -rf $(OBJS)
