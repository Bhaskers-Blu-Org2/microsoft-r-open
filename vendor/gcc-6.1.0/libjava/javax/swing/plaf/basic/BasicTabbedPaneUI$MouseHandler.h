
// DO NOT EDIT THIS FILE - it is machine generated -*- c++ -*-

#ifndef __javax_swing_plaf_basic_BasicTabbedPaneUI$MouseHandler__
#define __javax_swing_plaf_basic_BasicTabbedPaneUI$MouseHandler__

#pragma interface

#include <java/awt/event/MouseAdapter.h>
extern "Java"
{
  namespace java
  {
    namespace awt
    {
      namespace event
      {
          class MouseEvent;
      }
    }
  }
  namespace javax
  {
    namespace swing
    {
      namespace plaf
      {
        namespace basic
        {
            class BasicTabbedPaneUI;
            class BasicTabbedPaneUI$MouseHandler;
        }
      }
    }
  }
}

class javax::swing::plaf::basic::BasicTabbedPaneUI$MouseHandler : public ::java::awt::event::MouseAdapter
{

public:
  BasicTabbedPaneUI$MouseHandler(::javax::swing::plaf::basic::BasicTabbedPaneUI *);
  virtual void mouseReleased(::java::awt::event::MouseEvent *);
  virtual void mousePressed(::java::awt::event::MouseEvent *);
  virtual void mouseEntered(::java::awt::event::MouseEvent *);
  virtual void mouseExited(::java::awt::event::MouseEvent *);
  virtual void mouseMoved(::java::awt::event::MouseEvent *);
public: // actually package-private
  virtual void redispatchEvent(::java::awt::event::MouseEvent *);
  ::javax::swing::plaf::basic::BasicTabbedPaneUI * __attribute__((aligned(__alignof__( ::java::awt::event::MouseAdapter)))) this$0;
public:
  static ::java::lang::Class class$;
};

#endif // __javax_swing_plaf_basic_BasicTabbedPaneUI$MouseHandler__