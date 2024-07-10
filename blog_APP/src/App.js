import "tailwindcss/dist/base.css";
import "styles/globalStyles.css";
import React from "react";
// import { css } from "styled-components/macro"; //eslint-disable-line

import BlogIndex from "pages/BlogIndex";
import Blog from "pages/Blog";

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import useFetch from "hooks/useFetch";

export default function App() {

  const {loading, error, data} = useFetch('http://somesh-api.contentecho.in:1337/api/blogs?populate=*')

  if (loading) return <p>wait its loading!</p>
  // if (error) return <p>checkout there is an error in your code!</p>
  console.log(data)
  console.log(error)
  // console.log(data.data[0].attributes.blogTitle)



  return (
    <Router>
      <Switch>

        <Route path="/blog/:id">
          <Blog posts = {data}/>
        </Route>


        <Route path="/">
          <BlogIndex posts = {data} />
        </Route>


      </Switch>
    </Router>
  );
}
