using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(smrProject2.Startup))]
namespace smrProject2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
