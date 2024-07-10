import React from "react";
import AnimationRevealPage from "helpers/AnimationRevealPage.js";
import { Container, ContentWithPaddingXl } from "components/misc/Layouts";
import tw from "twin.macro";
import styled from "styled-components";
import { css } from "styled-components/macro"; //eslint-disable-line
import Header from "components/headers/light.js";
import Footer from "components/footers/FiveColumnWithInputForm.js";
import { SectionHeading } from "components/misc/Headings";
import { useParams } from "react-router-dom/cjs/react-router-dom.min";

const HeadingRow = tw.div`flex`;
const Heading = tw(SectionHeading)`text-gray-900 mb-10`;
const Text = styled.div`
  ${tw`text-lg  text-gray-800`}
  p {
    ${tw`mt-2 leading-loose`}
  }
  h1 {
    ${tw`text-3xl font-bold mt-10`}
  }
  h2 {
    ${tw`text-2xl font-bold mt-8`}
  }
  h3 {
    ${tw`text-xl font-bold mt-6`}
  }
  ul {
    ${tw`list-disc list-inside`}
    li {
      ${tw`ml-2 mb-3`}
      p {
        ${tw`mt-0 inline leading-normal`}
      }
    }
  }
`;

const renderContent = (content) => {
  return content.map((block, index) => {
    switch (block.type) {
      case 'list':
        return (
          <ul key={index} style={{ listStyleType: block.format === 'ordered' ? 'decimal' : 'disc' }}>
            {block.children.map((listItem, itemIndex) => (
              <li key={itemIndex}>{renderContent(listItem.children)}</li>
            ))}
          </ul>
        );
      case 'paragraph':
        return <p key={index}>{renderContent(block.children)}</p>;
      case 'text':
        return block.text;
      default:
        console.warn('Unhandled block type:', block.type);
        return null;
    }
  });
};

let headingText = "Privacy Policy"
export default ({posts}) => {

  const params = useParams()
  // console.log(params)
  let post = posts.data.filter(posts => posts.id == params.id)
  console.log(post[0].attributes.blogContent)

  return (
    <AnimationRevealPage>
      <Header />
      <Container>
        <ContentWithPaddingXl>
          <HeadingRow>
            <Heading>{post[0].attributes.blogTitle}</Heading>
          </HeadingRow>
          <Text>
          {renderContent(post[0].attributes.blogContent)}


            {/* {post[0].attributes.blogContent.map((block, index) => {
              if (block.type === 'paragraph') {
                return (
                  <p key={index}>
                    {block.children.map((child, childIndex) => {
                      if (child.type === 'text') {
                        return <span key={childIndex}>{child.text}</span>;
                      }
                      
                      return null;
                    })}
                  </p>
                );
              }
              // Add more conditions here for other block types if needed
              return null;
            })} */}
          </Text>
        </ContentWithPaddingXl>
      </Container>
      <Footer />
    </AnimationRevealPage>
  );
};
