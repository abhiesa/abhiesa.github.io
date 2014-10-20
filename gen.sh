rm -r public
hexo generate
cd public
python -m SimpleHTTPServer
cd ..