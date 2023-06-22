using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Tejal_Site.Startup))]
namespace Tejal_Site
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
