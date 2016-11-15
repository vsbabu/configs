#!/bin/bash
for f in `find . -name setup -type f`;do
  d=`dirname $f`
  cd $d
  ./setup
  cd -
done
# vim: ai ts=2 sw=2 et sts=2 ft=sh

