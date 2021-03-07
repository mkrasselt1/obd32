#!/bin/sh

D=$(dirname $0)

sed -i -re '1 s/.*/Designator,Val,Package,Mid X,Mid Y,Rotation,Layer/' *-pos.csv
