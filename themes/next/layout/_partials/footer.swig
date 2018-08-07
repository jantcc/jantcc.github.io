<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

{% if theme.copyright %}
<div>
	技术小站稳定运行中~~
</div>

<!-- <div class="theme-info"> -->
<!--   {{ __('footer.theme') }} - -->
<!-- 	半透明个性主题-->
<!--  </div> -->
{% endif %}
