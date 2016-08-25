class RedmineAnalyticsHooks < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = { })
    return "
      <script type='text/javascript'>
        !function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error('Segment snippet included twice.');else{analytics.invoked=!0;analytics.methods=['trackSubmit','trackClick','trackLink','trackForm','pageview','identify','reset','group','track','ready','alias','page','once','off','on'];analytics.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);analytics.push(e);return analytics}};for(var t=0;t<analytics.methods.length;t++){var e=analytics.methods[t];analytics[e]=analytics.factory(e)}analytics.load=function(t){var e=document.createElement('script');e.type='text/javascript';e.async=!0;e.src=('https:'===document.location.protocol?'https://':'http://')+'cdn.segment.com/analytics.js/v1/'+t+'/analytics.min.js';var n=document.getElementsByTagName('script')[0];n.parentNode.insertBefore(e,n)};analytics.SNIPPET_VERSION='3.1.0';
          analytics.load('#{Setting.plugin_redmine_analytics['segment_write_key']}');
          analytics.page();
          analytics.identify(#{User.current.id},{
            name: '#{User.current.firstname} #{User.current.lastname}',
            email: '#{User.current.mail}'
          });
          $(document).ready(function(){
            $('form').each(function(){
              if ($(this).attr('id')){
                var formName = $(this).attr('id');
              }else{
                var formName = $(this).parent().attr('id');
              }
              analytics.trackForm($(this), 'Form: ' + formName);
            });
            $('a').each(function(){
              analytics.trackLink($(this), 'Clicked: ' + $(this).attr('href'));
            });
          });
        }}();
      </script>
    "
  end
end
