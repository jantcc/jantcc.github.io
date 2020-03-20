<script>
var gitment = new Gitment({
  id: decodeURI(window.location.pathname),
  owner: 'jantcc',
  repo: 'blogcomments',
  oauth: {
    client_id: 'ab9dca6cbab84945addc',
    client_secret: '9f2bd74ba87092340af4ae7f4512d3a2babe94cb',
  },
})
gitment.render('comments')
</script>
